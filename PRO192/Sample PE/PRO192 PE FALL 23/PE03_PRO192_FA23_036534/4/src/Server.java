
public class Server implements Protocol{

    @Override
    public String sendMessage(String string) {
        return "65535:" + string.length() + ":" +string;
    }

    @Override
    public String receivePacket(String string) {
        String arrStr[] = string.split(":");
        return arrStr[arrStr.length-1];
    }
    
}
