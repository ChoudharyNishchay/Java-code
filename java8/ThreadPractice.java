package java8;

class ThreadPractice extends Thread {
    public void run() {
        for (int i = 0; i <= 5; i++) {
            System.out.println("thread count: " + i + "Thread name :" + Thread.currentThread().getName());

        }
    }

    public static void main(String args[]) {
        ThreadPractice t1 = new ThreadPractice();
        t1.setName("Thread1");
        t1.start();

        ThreadPractice t2 = new ThreadPractice();
        t2.setName("Thread2");
        t2.start();


    }
}
