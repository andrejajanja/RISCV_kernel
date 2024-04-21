//
// Created by os on 4/13/24.
//

#include "../h/mem.hpp"
#include "../h/riscv.hpp"

MemSegment* MemoryAllocator::segmentsHead = nullptr;
uint32 MemoryAllocator::totalSize = 0;
uint32 MemoryAllocator::segmentsNumber = 1;

void MemoryAllocator::initialize(){
    MemoryAllocator::segmentsHead = (MemSegment*)(HEAP_START_ADDR);
    segmentsHead->left = nullptr;
    segmentsHead->right = nullptr;
    //size of every block is in number of memory blocks, not bytes
    segmentsHead->size = size_t(uint64(HEAP_END_ADDR) - uint64(HEAP_START_ADDR))/MEM_BLOCK_SIZE;
    totalSize = MemoryAllocator::segmentsHead->size;
}

//TODO TEST: check for bugs in this implementation - mem_allocate
void* MemoryAllocator::mem_allocate(size_t size) {
    //doing some checks if it should even try to allocate space
    if(segmentsNumber == 0 || size > totalSize) return nullptr;

    //TODO in the future, upgrade 'first fit' to some exotic algorithm with binary tree

    MemSegment* temp = segmentsHead;
    while(temp){
        if(size == temp->size){
            totalSize-=size; segmentsNumber--;

            if(temp->left) temp->left->right = temp->right;
            if(temp->right) temp->right->left = temp->left;

            *((size_t*)temp) = size; //this is size in segments stored in metadata
            temp += sizeof(size_t); //shift pointer to account for metadata
            return (void*)temp;
        }

        if(size < temp->size){
            size_t offset = size*MEM_BLOCK_SIZE;
            if(temp->left) temp->left->right = temp + offset;
            if(temp->right) temp->right->left = temp + offset;

            (temp + offset)->left = temp->left;
            (temp + offset)->right = temp->right;
            (temp + offset)->size = temp->size-size;

            if(temp == segmentsHead) segmentsHead += offset;

            size_t* tempMeta = (size_t*)temp;
            *((size_t*)tempMeta) = size; //this is size segments stored in metadata
            tempMeta += sizeof(size_t); //shift pointer to account for metadata
            return (void*)tempMeta;
        }
        temp = temp->right;
    }

    //segment of sufficient size wasn't found, thus returning null for failed allocation
    return nullptr;
}

//TODO TEST: check for bugs in this implementation - mem_free
int MemoryAllocator::mem_free(void* ptr) {
    //TODO optimize these 4 lines
    size_t size = *((size_t*)(ptr)-sizeof(size_t));
    MemSegment* pointer = (MemSegment*)ptr-sizeof(size_t);
    totalSize += size;
    pointer->size = size;

    //5,6
    size_t offset = size*MEM_BLOCK_SIZE;

    if(pointer > segmentsHead){
        pointer->left = nullptr;

        if(pointer+offset == segmentsHead){ //5 try join from the right
            pointer->right = segmentsHead->right;
            pointer->size+=segmentsHead->size;
        }else{ //6 couldn't do join :(
            pointer->right = segmentsHead;
            segmentsHead->left = pointer;
        }

        segmentsHead = pointer;
        return 0;
    }

    MemSegment* temp = segmentsHead;
    //TODO tidy this entire while loop up
    while(temp){
        if(temp->right){ //1, 2, 3, 4
            if(temp < pointer && pointer < temp->right){
                if(pointer + offset == temp->right){ //3 or 4
                    pointer->size += temp->right->size;
                    pointer->right = temp->right->right;
                    pointer->left = temp->left;
                }

                if(temp + temp->size*MEM_BLOCK_SIZE == pointer){ //2 or 4
                    temp->size += pointer->size;
                    if(pointer->left == temp){
                        temp->right = pointer->right;
                    }
                }

                return 0;
            }

            temp = temp->right;
        }else{ // 7, 8
            if(temp + temp->size*MEM_BLOCK_SIZE == pointer){ //8
                temp->size += pointer->size;
            }else{ //7
                temp->right = pointer;
                pointer->left = temp;
            }

            return 0;
        }
    }

    return 0;
}