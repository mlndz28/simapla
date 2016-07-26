SELECT 'users/WebService';
CREATE USER 'WebService' IDENTIFIED BY 'ws*3';
  GRANT
    SELECT
    ON TABLE `SimaplaDb`.* TO 'WebService';
  GRANT
    SELECT,
    INSERT,
    TRIGGER
    ON TABLE `SimaplaDb`.* TO 'WebService';
  GRANT
    SELECT,
    INSERT,
    TRIGGER,
    UPDATE,
    DELETE
    ON TABLE `SimaplaDb`.* TO 'WebService';
  GRANT
    EXECUTE
    ON ROUTINE `SimaplaDb`.* TO 'WebService';
