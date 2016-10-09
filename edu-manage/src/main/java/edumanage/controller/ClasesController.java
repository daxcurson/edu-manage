package edumanage.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import edumanage.documentation.DescripcionClase;

@Controller
@RequestMapping("clases")
@DescripcionClase(value="Clases")
public class ClasesController extends AppController
{
	static Logger log = Logger.getLogger(ClasesController.class);
}
