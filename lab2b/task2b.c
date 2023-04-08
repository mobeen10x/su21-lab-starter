#include <stdio.h>


struct student 
{
    /* data */
    char name[50] ;
    char id[50];
    int age ;
};



int main()
{
  struct  student obj;

  printf( "Enter the name : ");
  scanf("%s",obj.name);

  printf( "Enter the id of %s : ",obj.name);
  scanf("%s",obj.id);

  printf( "Enter the age of %s : ",obj.name);
    
 scanf("%d",&obj.age);


 printf("Entered data of Student \n");

  printf("Name  : %s  \n" ,obj.name);
  printf("ID  : %s  \n" ,obj.id);
  printf("Age  : %d  \n" ,obj.age);


return 0; 

}