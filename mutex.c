#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdint.h> 

#define NUM_THREADS 5
#define NUM_INCREMENTS 1000

int counter = 0;
pthread_mutex_t mutex; 

void *increment_counter(void *thread_id) {
  
    intptr_t tid = (intptr_t) thread_id;
    
   
    for (int i = 0; i < NUM_INCREMENTS; i++) {
    
        pthread_mutex_lock(&mutex);
        counter++;
        
        pthread_mutex_unlock(&mutex);
    }
    
  
    pthread_exit(NULL);
}

int main() {
    pthread_t threads[NUM_THREADS];
    int rc, t;

  
    pthread_mutex_init(&mutex, NULL);

    for (t = 0; t < NUM_THREADS; t++) {
        
        rc = pthread_create(&threads[t], NULL, increment_counter, (void *)(intptr_t)t);
        if (rc) {
            printf("ERROR %d\n", rc);
            exit(-1);
        }
    }

    for (t = 0; t < NUM_THREADS; t++) {
        pthread_join(threads[t], NULL);
    }


    pthread_mutex_destroy(&mutex);

    printf("Final value of counter is %d\n", counter);

    return 0;
}
