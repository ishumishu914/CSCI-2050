#include <iostream>

int main()
{
    int array[] = {1,2,3,6,8,9,12};
    int size = 7, sum =0;

    for(int i=0; i<size; i++)
    {
        if(array[i]%3 == 0)
        {
            sum += array[i];
        }
    }
    printf("The sum is %d", sum);
    return 0;
}