package java8;


public class SynchronizationBlock extends Thread {
    @Override
    public void run() {
        synchronized (this) {
            for (int i = 0; i <= 5; i++) {
                System.out.println("thread count: " + i + "Thread name :" + Thread.currentThread().getName());
//                try {
//                    Thread.sleep(500);
//                } catch (Exception e) {
//                    System.out.println(e);
//                }
            }
        }
    }


    public static void main(String[] args) {
        SynchronizationBlock obj = new SynchronizationBlock();

        Thread t1 = new Thread(obj);
        Thread t2 = new Thread(obj);
        t1.setName("Java");
        t1.start();
        t2.setName("Program");
        t2.start();

    }

}
