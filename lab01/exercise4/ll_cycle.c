#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* TODO: Implement ll_has_cycle */

    node * fast_ptr = head;
    node * slow_ptr= head;
    if (fast_ptr==NULL)
    {
        return 0;
    }
    while(slow_ptr->next!=NULL && fast_ptr->next!=NULL && fast_ptr->next->next!=NULL)
    {
       slow_ptr= slow_ptr->next;
       fast_ptr= fast_ptr->next->next;

if(fast_ptr==slow_ptr)
{
    return 1 ;
}

}

    return 0 ;

}
