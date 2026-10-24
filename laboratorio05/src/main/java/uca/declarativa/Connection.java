package uca.declarativa;

import alice.tuprolog.Prolog;
import alice.tuprolog.SolveInfo;
import alice.tuprolog.Theory;

import java.io.InputStream;

public class Connection {
    private final Prolog engine = new Prolog();
    public Connection() throws Exception {
        try (InputStream in = getClass().getResourceAsStream("/calculo.pl"))
        {
            if (in == null) throw new IllegalStateException("No se encontró calculo.pl");
                    engine.setTheory(new Theory(in));
        }
    }
    public String consultar(String predicado, String expresion) throws Exception {
        SolveInfo info = engine.solve(predicado + "(x, " + expresion + ", R).");
        return info.isSuccess() ? engine.toString(info.getTerm("R"))
                : "Sin solución para esa expresión";
    }
}
