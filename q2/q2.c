#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
int minimum = 0;
int maximum = 0;
int size = 0;
double average = 0;



void *calculateMinimum(void *args)
{
int *curr_p = (int* ) args;
int temp = curr_p[0];
for( int i = 0 ; i < size ; i++)
{
	if(curr_p[i] < temp )
	{
		temp = curr_p[i];
	}
}
minimum = temp;
pthread_exit(0);
}


void *calculateMaximum(void *args)
{
int *curr_p = (int* ) args;
int temp = curr_p[0];
for( int i = 0 ; i < size ; i++)
{
	if(curr_p[i] > temp )
	{
		temp = curr_p[i];
	}
}
maximum = temp;
pthread_exit(0);
}

void *calculateAverage(void *args)
{
int summation = 0;
int *curr_p = (int* ) args;
for( int i = 0 ; i < size ; i++)
{
	summation += curr_p[i];
}
average = summation / size;
pthread_exit(0);
}

int main ( int argc, char* argv[])
{
	int* numbers = (int *)malloc((argc-1)*sizeof(int));
	for(int i = 1; i < argc ; i++)
	{
		numbers[i-1] = atoi(argv[i]);
		size++;
	}
	pthread_t minimumThread;
	pthread_t maximumThread;
	pthread_t averageThread;
	
	
	pthread_create(&minimumThread, NULL, calculateMinimum, (void*)numbers);
	pthread_create(&maximumThread, NULL, calculateMaximum, (void*)numbers);
	pthread_create(&averageThread, NULL, calculateAverage, (void*)numbers);
	
	pthread_join(minimumThread , NULL);
	pthread_join(maximumThread , NULL);
	pthread_join(averageThread , NULL);
	
	
	printf("The minimum value is %d \n",minimum);
	printf("The maximum value is %d \n",maximum);
	printf("The average value is %f \n",average);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
