package simple;
import java.util.Random;
import nl.flotsam.xeger.Xeger;

public class JavaCode {

    public static String giveMeString(int x){
      String result=null;
        int y = 33;
        int randNumber;
        Random rn = new Random(x);
        // rn.setSeed(x);
        randNumber = rn.nextInt();
        try {
          String regex = "(a|b)(1|1000)[cd]{3}"+randNumber+"(a|b)[cd]{3}";
          Xeger generator = new Xeger(regex);
          result = generator.generate();
          System.out.println("Hurrayyyyyyyy !!!!!!!!!!!!!!" + result);
        } catch(Throwable ex) {
          ex.printStackTrace();
        }
        return result;
    }
}
