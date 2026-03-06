Feature: Gestión de gastos
  Como estudiante
  Quiero registrar mis gastos
  Para controlar cuánto dinero gasto

  Scenario: Crear un gasto y comprobar cual es el total que llevo gastado
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 5 euros

  Scenario: Eliminar un gasto y comprobar cual es el total que llevo gastado
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear y eliminar un gasto y comprobar que no he gastado dinero
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear dos gastos diferentes y comprobar que el total que llevo gastado es la suma de ambos
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear tres gastos diferentes que sumen 30 euros hace que el total sean 30 euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 15 euros llamado Comida
    And añado un gasto de 10 euros llamado Mopa
    Then el total de dinero gastado debe ser 30 euros
  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Mopa
    And añado un gasto de 30 euros llamado Comida
    And añado un gasto de 30 euros llamado Carrito
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros
  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 30 euros llamado Comida
    And añado un gasto de 30 euros llamado Postre
    And elimino el gasto con id 3
    Then debe haber 2 gastos registrados
  Scenario: Registrar múltiples gastos incrementa el número total de gastos en el sistema
    Given un gestor de gastos vacío
    When añado un gasto de 20 euros llamado Libro
    And añado un gasto de 50 euros llamado Zapatillas
    Then debe haber 2 gastos registrados

  Scenario: Eliminar el único gasto existente deja el total de dinero en 0
    Given un gestor con un gasto de 50 euros
    When elimino el gasto con id 1
    Then el total de dinero gastado debe ser 0 euros

  Scenario: Eliminar un gasto intermedio no afecta a los demás gastos registrados
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Cine
    And añado un gasto de 20 euros llamado Palomitas
    And añado un gasto de 5 euros llamado Refresco
    And elimino el gasto con id 2
    Then el total de dinero gastado debe ser 15 euros
    And debe haber 2 gastos registrados