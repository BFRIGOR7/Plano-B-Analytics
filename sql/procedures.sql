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
        p_prodpduto_id,
        p_quantidade,
        p_preco_unitario
    );

END $$

DELIMITER ;