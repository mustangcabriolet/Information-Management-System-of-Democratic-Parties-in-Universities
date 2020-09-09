package GP.Test;


import java.util.Arrays;
import java.util.List;

public class 数组转List {
    public static void main(String[] args) {
        String title[] = {"理财风险评估","卡片信息维护","客户信息修改","身份认证","密码重置","卡片激活","客户账户信息展示"};
        System.out.println(Arrays.asList(title));
        int num[] = {1,2,3};
        List list = Arrays.asList(num);
        System.out.println(list.size());
    }
}
