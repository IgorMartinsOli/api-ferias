/**
 * Arquivo: FeriasController.js
 * Descrição: Responsável por gerenciar as Férias
 * Data: 12/05/2020
 * Autor: Matheus Ricardo Brunelli
 */

const db = require('../config/database')

// Formatar data com RegExp
function formatarData(data) {
    return data.replace(/^(\d{4})[-](\d{2})[-](\d{2}).*/g, '$1-$2-$3')
}

module.exports = {
    // Listar Férias
    async listAll(req, res) {
        try {
            const response = await db.query(`
                SELECT 
                    f.idferias,
                    f.data_inclusao,
                    to_char(f.data_inicio, 'DD/MM/YYYY') data_inicio,
                    to_char(f.data_fim, 'DD/MM/YYYY') data_fim,
                    f.idcolaborador,
                    c.nome,
                    c.idfilial
                FROM ferias f
                LEFT JOIN colaborador c ON c.idcolaborador = f.idcolaborador
            `)

            return res.json(response.rows)

        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar férias: ${err}`
            })
        }
    },

    // Listar Férias pelo id
    async listById(req, res) {
        try {
            const response = await db.query(`
                SELECT 
                    f.idferias,
                    f.data_inclusao,
                    to_char(f.data_inicio, 'DD/MM/YYYY') data_inicio,
                    to_char(f.data_fim, 'DD/MM/YYYY') data_fim,
                    f.idcolaborador,
                    c.nome,
                    c.idfilial
                FROM ferias f
                LEFT JOIN colaborador c ON c.idcolaborador = f.idcolaborador
                WHERE f.idferias = ${req.params.id}
             `)

            // Verificar se retornou algum resultado
            if (response.rowCount == 0) return res.status(401).json({
                error: true,
                message: 'Férias não encontrada!',
                rows: `Linhas executadas: ${err}`
            })

            return res.json(response.rows)

        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar férias: ${err}`
            })
        }
    },

    // Listar histoórico de férias do colaborador
    async listAllOfColaborador(req, res) {
        try {
            const response = await db.query(`
                SELECT 
                    f.idferias,
                    f.data_inclusao,
                    to_char(f.data_inicio, 'DD/MM/YYYY') data_inicio,
                    to_char(f.data_fim, 'DD/MM/YYYY') data_fim,
                    f.idcolaborador,
                    c.nome,
                    c.idfilial
                FROM ferias f
                LEFT JOIN colaborador c ON c.idcolaborador = f.idcolaborador
                WHERE f.idcolaborador = ${req.params.id}
            `)

            // Verificar se retornou algum resultado
            if (response.rowCount == 0) return res.status(401).json({
                error: true,
                message: 'Férias não encontrada!',
                rows: `Linhas executadas: ${response.rowCount}`
            })

            return res.json(response.rows)

        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar férias: ${err}`
            })
        }
    },

    // Cadastrar Férias
    async createNew(req, res) {
        // Pegar conteúdo do body da requisição
        const {
            idcolaborador,
            data,
        } = req.body

        {/** 
            A data vem do RangerPicker em um array com duas posições, sendo a primeira a data inicio e a segunda data fim
            Também jogo as duas posições na formatarData para enviar para o banco de dados apenas a data
        */}
        const data_inicio = formatarData(data[0])
        const data_fim = formatarData(data[1])

        try {
            await db.query("INSERT INTO ferias (idcolaborador, data_inicio, data_fim) VALUES ($1, $2, $3)",
                [idcolaborador, data_inicio, data_fim]
            )

            return res.json({
                error: false,
                message: 'Férias cadastrada com sucesso!'
            })

        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao cadastrar férias: ${err}`
            })
        }
    },

    // Deletar férias pelo id
    async deleteById(req, res) {
        try {
            const response = await db.query(`DELETE FROM ferias WHERE idferias = ${req.params.id}`)

            // Verificar se a query foi executada
            if (response.rowCount == 0) return res.status(401).json({
                error: true,
                message: 'Férias não encontrada!',
                rows: `Linhas executadas: ${response.rowCount}`
            })

            return res.json({
                error: false,
                message: 'Férias deletada com sucesso!',
                rows: `Linhas executadas: ${response.rowCount}`
            })

        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao deletar férias: ${err}`
            })
        }
    },
}