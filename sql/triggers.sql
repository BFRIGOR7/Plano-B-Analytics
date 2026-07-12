-- Triggers

DELIMITER $$

CREATE TRIGGER trg_saida_estoque_venda
AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN

    UPDATE produtos
    SET estoque_atual = estoque_atual - NEW.quantidade
    WHERE id = NEW.produto_id;

    INSERT INTO movimentacoes_estoque (
        produto_id,
        tipo,
        quantidade,
        data_movimentacao
    )
    VALUES (
        NEW.produto_id,
        'SAIDA',
        NEW.quantidade,
        CURDATE()
    );

END $$

DELIMITER ;