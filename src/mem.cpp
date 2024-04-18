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

void* MemoryAllocator::mem_allocate(size_t size) {
    //doing some checks if it should even try to allocate space
    if(segmentsNumber == 0 || size > totalSize) return nullptr;

    //first fit algorithm -- TODO in the future, upgrade this to some exotic algorithm with binary tree
    MemSegment* temp = segmentsHead;
    while(temp){ // TODO TEST: check for bugs in this implementation

        if(size == temp->size){
            if(temp->left) temp->left->right = temp->right;
            if(temp->right) temp->right->left = temp->left;
            segmentsNumber--;
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

            *((size_t*)temp) = size; //this is size in segments stored in metadata
            temp += sizeof(size_t); //shift pointer to account for metadata
            return (void*)temp;
        }
        temp = temp->right;
    }

    //segment of sufficient size wasn't found, thus returning null for failed allocation
    return nullptr;
}

int MemoryAllocator::mem_free(void* ptr) {
    size_t offset = *((size_t*)ptr-sizeof(size_t)) * MEM_BLOCK_SIZE;
    MemSegment* pointer = (MemSegment*)ptr-sizeof(size_t);

    printUint(offset);

    //TODO MEM_FREE: WRITE THIS ON PAPER SO YOU GET ALL THE EDGE CASES RIGHT!!!
    MemSegment* temp = segmentsHead;
    while(temp){
        //detect between which segments is this segment to be fred up
        if(temp->right){
            if(temp < pointer && pointer < temp->right){

            }else{
                temp = temp->right;
                continue;
            }

        }else{
            if(temp < pointer){

            }
        }

        temp = temp->right;
    }

    return 0;
}