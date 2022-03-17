/**
 * Arquivo: ColaboradorController.js
 * Descrição: Responsável por gerenciar os colaboradores (Cadastrar, Listar, Atualizar e Deletar Colaboradores)
 * Data: 12/05/2020
 * Autor: Matheus Ricardo Brunelli
 */

const db = require('../config/database')

module.exports = {
    // Listar todos os colaboradores
    async listAll(req, res) {
        try {
            const response = await db.query("SELECT * FROM colaborador")
            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar colaboradores: ${err}`
            })
        }
    },

    // Listar colaborador pelo id
    async listById(req, res) {
        try {
            const response = await db.query(`SELECT * FROM colaborador WHERE idcolaborador = ${req.params.id}`)

            // Verificar se retornou algum resultado
            if (response.rowCount == 0) {
                return (
                    res.status(400).json({
                        error: true,
                        message: 'Colaborador não encontrado!',
                        rows: `Linhas executadas: ${response.rowCount}`
                    })
                )
            }

            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar colaborador: ${err}`
            })
        }
    },

    // Listar colaborador pelo id da filial
    async listByFilialId(req, res) {
        try {
            const response = await db.query(`SELECT * FROM colaborador WHERE idfilial = ${req.params.id}`)

            // Verificar se retornou algum registro
            if (response.rowCount == 0) {
                return (
                    res.status(400).json({
                        error: true,
                        message: 'Colaborador não encontrado!',
                        rows: `Linhas executadas: ${response.rowCount}`
                    })
                )
            }

            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar colaboradores: ${err}`
            })
        }
    },
}