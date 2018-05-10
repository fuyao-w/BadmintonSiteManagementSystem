package mvc;

import bean.prep;
import mapper.prepMapper;
import mapper.saleMapper;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

public class orderUtil {
    //protected CopyOnWriteArrayList<sale> arrayList;



//    protected CopyOnWriteArrayList<sale> getArrayList() {
//        if (arrayList == null) {
//            arrayList = new CopyOnWriteArrayList<>();
//            return arrayList;
//        } else {
//            if (arrayList.isEmpty())
//               arrayList= msaleMapper.getall();
//            return arrayList;
//        }
//
//    }


    @Transactional(isolation = Isolation.REPEATABLE_READ, timeout = 1)
   public static void order(saleMapper msaleMapper, prepMapper mprepMapper, int id, prep prep) {

        msaleMapper.updj(id);
        mprepMapper.inprep(prep);

    }
}
