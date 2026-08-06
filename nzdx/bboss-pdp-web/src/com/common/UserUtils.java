package com.common;

import bboss.org.apache.velocity.runtime.directive.Foreach;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.platform.security.authorization.AuthRole;

public class UserUtils {

    public static boolean isHasRole(String roleName){
        AccessControl control = AccessControl.getAccessControl();
        String userAccount = control.getUserAccount();
        if("guest___".equals(userAccount)) {
            return false;
        }
        AuthRole[] array = AccessControl.getAllRoleofUser(control.getUserAccount());
        for(AuthRole bean : array){
            if(roleName.equals(bean.getRoleName())) {
                return true;
            }
        }

        return false;
    }

    public static int isHasRoleNum(){
        AccessControl control = AccessControl.getAccessControl();
        String userName = control.getUserAccount();
        int i = 0;

        if("admin".equals(userName)) {
            return 0;
        }

        AuthRole[] array = AccessControl.getAllRoleofUser(userName);

        for(AuthRole ar: array) {
            if("role".equals(ar.getRoleType())) {
                ++i;
            }

        }
        return  i;

    }


}
