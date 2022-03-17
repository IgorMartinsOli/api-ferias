/**
 * Arquivo: FilialController.js
 * Descrição: Responsável por gerenciar as Filiais
 * Data: 12/05/2020
 * Autor: Matheus Ricardo Brunelli
 */

const db = require('../config/database')

module.exports = {
    // Listar filiais
    async listAll(req, res) {
        try {
            const response = await db.query("SELECT * FROM filial")
            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar filiais: ${err}`
            })
        }
    },

    // Listar filiais pelo id
    async listById(req, res) {
        try {
            const response = await db.query(`SELECT * FROM filial WHERE idfilial = ${req.params.id}`)

            // Verificar se retornou algum resultado
            if (response.rowCount == 0) {
                return (
                    res.status(400).json({
                        error: true,
                        message: 'Filial não encontrada!',
                        rows: `Linhas executadas: ${response.rowCount}`
                    })
                )
            }

            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar filial: ${err}`
            })
        }
    },
}