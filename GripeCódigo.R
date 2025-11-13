# Gripe del British Medical Jounal SIR
# 22 de enero al 4 de febrero 1978 (14)

library(deSolve)


ed.sol.gripe = function( t, state, parms)
{
  with(as.list(state),
       {
         dxdt = rep(0, length(state))
         dxdt[1] = -(beta*I*S)/N            # Suceptibles
         dxdt[2] = (beta*I*S)/N - gamma*I   # Infectados
         dxdt[3] = gamma*I                  # Recuperados
         return(list(dxdt))
       })
}

# Establecemos las condiciones iniciales

beta = 1.6       # Tasa de infección
gamma = 0.41     # Tasa de recuperación
N = 763           # Población total
t = seq(0,25,1)   # rango a graficar
S0 = N - 1        # Suponiendo que hay 1 infectado al inicio
I0 = 1
R0 = 0
init = c(S = S0, I = I0, R = R0)


# Resultado de la función ODE
res_irs_gripe = ode(
  y= init,
  times = t,
  func = ed.sol.gripe ,
  parms = NULL
)

# Resultado del primer modelo
head(res_irs_gripe)

# Rango en y
y_axis = c(0, 800)

# Graficamos la variable S (Suceptibles)

plot(
  res_irs_gripe[, "time"],
  res_irs_gripe[, "S"],
  type = "o",
  xlab = "Tiempo (días)",
  ylab = "Individuos",
  ylim = y_axis,
  col = "#89E95D",
  main = "Modelo SIR - Gripe contenida"
)

# La variable I (Infectados)
lines(
  res_irs_gripe[, "time"],
  res_irs_gripe[, "I"],
  type = "o",
  col = "#F399A7"
)

# La variable R (Recuperados)
lines(
  res_irs_gripe[, "time"],
  res_irs_gripe[, "R"],
  type = "o",
  col = "#cd2d11"
)

# Decoración
legend(
  "topright",
  legend = c("Suceptibles", "Infectados", "Recuperados"),
  col = c("#89E95D", "#F399A7", "#cd2d11"),
  lty = 1,
  pch = 1
)


# Comparación con datos reales
# Datos de la tabla
dias <- 1:14      # Creamos el rango de los 14 días
infectados_tabla <- c(3, 8, 28, 75, 221, 291, 255, 235, 190, 125, 70, 28, 12, 5)

# Graficamos los puntos sobre la curva de infectados
points(
  dias,
  infectados_tabla,
  col = "blue",
  pch = 19,
  cex = 1.2
)

# Agregar leyenda para los puntos
legend(
  "bottomright",
  legend = c("Datos observados"),
  col = c("blue"),
  pch = 19
)