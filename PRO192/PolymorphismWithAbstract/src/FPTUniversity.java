public class FPTUniversity extends University implements Role{

    @Override
    public void createWorker() {
        System.out.println("providing human resources");
    }
    
    @Override
    public String toString() {
        return "FPTU has four campuses Hanoi, HCM, DaNang, CanTho, QuyNhon";
    }

}
