CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `Instrumentos` AS
    SELECT 
        `n`.`name` AS `Nombre`,
        `i`.`serialNumber` AS `# Serie`,
        `i`.`price` AS `Precio`,
        `i`.`color` AS `Color`,
        `i`.`model` AS `Modelo`,
        `p`.`name` AS `Patrimonio`
    FROM
        ((`Instrument` `i`
        JOIN `InstrumentName` `n` ON ((`n`.`idInstrumentName` = `i`.`InstrumentName_idInstrumentName`)))
        JOIN `Patrimony` `p` ON ((`p`.`idPatrimony` = `i`.`Patrimony_idPatrimony`)))
    ORDER BY `n`.`name`
