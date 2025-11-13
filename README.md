# Modelado-de-Brote-de-Gripe-con-el-Modelo-SIR-1978-
Proyecto de modelado epidemiológico que utiliza el Modelo SIR (Susceptible-Infectado-Removido) para simular y analizar un brote de gripe reportado en un internado de Inglaterra en 1978. El modelo se implementó en R.

## I. Resumen del Proyecto

Este proyecto de modelado epidemiológico implementa el **Modelo SIR (Susceptible-Infectado-Removido)** para simular la dinámica de un brote de gripe registrado en 1978 en un internado del norte de Inglaterra. El análisis se desarrolla en el entorno de **R** utilizando la librería `deSolve` para la resolución de Ecuaciones Diferenciales Ordinarias (ODEs).

Los objetivos principales incluyen:
1.  Determinar y ajustar los parámetros de transmisión ($\beta$) y recuperación ($\gamma$) del brote.
2.  Modelar la evolución temporal de las poblaciones (Susceptibles, Infectados, Removidos).
3.  Comparar la simulación obtenida con los datos reales registrados.

| Detalle | Valor |
| :--- | :--- |
| **Autores** | Montserrat Carrera Leal - Abigail Godoy Araujo |
| **Fecha** | 2025-10-06 |
| **Metodología** | Modelo SIR |
| **Herramienta** | R y librería `deSolve` |

---

## II. Contexto y Parámetros Iniciales

El modelo se basa en datos del brote reportado en el *British Medical Journal*.

### A. Condiciones Iniciales del Brote

* **Población Total ($N$):** 763 personas.
* **Total de Personas Infectadas (registrado):** 512.
* **Periodo de Modelado:** 14 días (22 de enero al 4 de febrero).
* **Simplificación:** No se consideró la tasa de mortalidad, dado que no se contaba con registros de muertes.

### B. Ecuaciones Diferenciales (ODEs)

Las ODEs del modelo SIR simplificado son:

| Compartimento | Ecuación simplificada |
| :--- | :--- |
| Susceptibles ($\frac{dS}{dt}$) | $\frac{dS}{dt} = -\beta I\frac{S}{N}$ |
| Infectados ($\frac{dI}{dt}$) | $\frac{dI}{dt} = \beta I\frac{S}{N} - \gamma I$ |
| Removidos ($\frac{dR}{dt}$) | $\frac{dR}{dt} = \gamma I$ |

### C. Parámetros de Simulación

Los valores de $\beta$ y $\gamma$ fueron ajustados para optimizar la representación gráfica de la curva de infectados.

| Parámetro | Símbolo | Valor Final Utilizado | Valor de Cálculo Inicial |
| :--- | :--- | :--- | :--- |
| **Población Total** | $N$ | 763 | 763 |
| **Susceptibles Iniciales** | $S(0)$ | 762 | 762 |
| **Infectados Iniciales** | $I(0)$ | 1 | 1 |
| **Tasa de Recuperación** | $\gamma$ | **0.41** | 0.5 (asumiendo 2 días de recuperación) |
| **Tasa de Transmisión** | $\beta$ | **1.6** | 0.0026 |

---

## III. Resultados y Conclusiones

### A. Gráfico de la Simulación

La imagen muestra la evolución de los tres compartimentos del modelo (S, I, R) a lo largo del tiempo, contrastada con los datos de infectados reales (puntos azules).

![Modelo SIR - Gripe contenida](Modelo_SIR_Gripe.png)

### B. Interpretación de la Dinámica

* **Susceptibles (S):** La rápida disminución de la curva confirma que el brote fue de alta contagiosidad, dejando una pequeña proporción de la población susceptible al final de la epidemia.
* **Infectados (I):** La curva presenta el pico epidémico esperado para una enfermedad contenida, disminuyendo a medida que el número de recuperados aumenta.
* **Ajuste del Modelo:** El modelo ajustado reproduce de manera satisfactoria la tendencia de los datos observados, validando los parámetros utilizados para esta población específica.

---

## IV. Requisitos y Uso

El proyecto requiere la instalación de R y de la librería `deSolve`.

* **Requisito:** **R** y la librería `deSolve`.
* **Archivo Principal:** `Modelado_de_Actividad_Gripe.Rmd` (Contiene el código fuente y la documentación).
* **Procedimiento:** Clonar el repositorio y ejecutar el código presente en el archivo `.Rmd` para replicar el análisis completo.
