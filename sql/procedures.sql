-- Stored Procedures

DELIMITER $$

CREATE PROCEDURE sp_registrar_item_venda(
    IN p_venda_id INT,
    IN p_produto_id INT,
    IN p_quantidade INT,
    IN p_preco_unitario DECIMAL(10,2)
)
BEGIN

    INSERT INTO itens_venda (
        venda_id,
        produto_id,
        quantidade,
        preco_unitario
    )
    VALUES (
        p_venda_id,
        p_produto_id,
        p_quantidade,
        p_preco_unitario
    );

END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_registrar_venda(
    IN p_forma_pagamento VARCHAR(30),
    IN p_data_venda DATE
)
BEGIN

    INSERT INTO vendas (
        forma_pagamento,
        data_venda
    )
    VALUES (
        p_forma_pagamento,
        p_data_venda
    );

    SELECT LAST_INSERT_ID() AS nova_venda_id;

END $$

DELIMITER ;