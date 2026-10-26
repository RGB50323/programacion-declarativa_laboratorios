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
    public String consultar(String predicado, String a, String b) throws Exception {
        String num = "-?\\d+(\\.\\d+)?";
        if (!a.matches(num) || !b.matches(num))
            throw new IllegalArgumentException("escribe solo números");
        SolveInfo info = engine.solve(predicado + "(" + a + ", " + b + ", R).");
        return info.isSuccess() ? info.getTerm("R").toString()
                : "Sin solución (¿división entre 0?)";
    }
}
