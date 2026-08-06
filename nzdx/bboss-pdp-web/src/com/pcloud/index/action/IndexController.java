package com.pcloud.index.action;
import org.frameworkset.web.servlet.ModelMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IndexController {
    private static Logger log = LoggerFactory.getLogger(IndexController.class);

    public String index(ModelMap model) {
        model.addAttribute("menu_id", 1);
        return "path:index";
    }

    public String toReview(String id,ModelMap model)  {
        model.addAttribute("menu_id", 2);
        model.addAttribute("id", id);
        return "path:toReview";
    }

    public String toProjectInfo(String id,ModelMap model)  {
        model.addAttribute("menu_id", 3);
        model.addAttribute("id", id);
        return "path:toProjectInfo";
    }


    public String toExperIndex(ModelMap model)  {
        model.addAttribute("menu_id", 4);
        return "path:toExperIndex";
    }

    public String toResource(ModelMap model)  {
        model.addAttribute("menu_id", 5);
        return "path:toResource";
    }

    public String toUserDb(ModelMap model)  {
        model.addAttribute("menu_id", 6);
        return "path:toUserDb";
    }

    public String toProjDeclar(ModelMap model)  {
        model.addAttribute("menu_id", 7);
        return "path:toProjDeclar";
    }

    public String toQuestions(ModelMap model)  {
        model.addAttribute("menu_id", 8);
        return "path:toQuestions";
    }





    public String toProject(String id,ModelMap model)  {
        model.addAttribute("menu_id", 999);
        model.addAttribute("id", id);
        return "path:toProject";
    }


    public String toProjectC(String id,ModelMap model)  {
        model.addAttribute("menu_id", 888);
        model.addAttribute("id", id);
        return "path:toProjectC";
    }

    public String toProjectD(String id,ModelMap model)  {
        model.addAttribute("menu_id", 777);
        model.addAttribute("id", id);
        return "path:toProjectD";
    }


    public String toNewsA(String id,ModelMap model)  {
        model.addAttribute("menu_id", 666);
        model.addAttribute("id", id);
        return "path:toNewsA";
    }

    public String toNewsB(String id,ModelMap model)  {
        model.addAttribute("menu_id", 555);
        model.addAttribute("id", id);
        return "path:toNewsB";
    }

    public String toNewsC(String id,ModelMap model)  {
        model.addAttribute("menu_id", 444);
        model.addAttribute("id", id);
        return "path:toNewsC";
    }

    public String toNewsD(String id,ModelMap model)  {
        model.addAttribute("menu_id", 333);
        model.addAttribute("id", id);
        return "path:toNewsD";
    }

}
