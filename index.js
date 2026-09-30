//Libraries
const express = require('express');
const multer = require('multer');
const mysql = require('mysql2/promise');
const classes = require('./Model/classes');
const { check, checkSchema, validationResult } = require('express-validator');

//Setup defaults for script
const app = express();
app.use(express.static('public'))
app.use(express.json());

const upload = multer()
const port = 80 //Default port to http server

let connection = null;

async function query(sql, params) {
    //Singleton DB connection
    if (null === connection) {
        console.log('Here');
        connection = await mysql.createConnection({
            host: "student-databases.cvode4s4cwrc.us-west-2.rds.amazonaws.com",
            user: "ZOEHARMANING", //same as username for DB connection
            password: "1BoBpUpbcc8ow9oYDBAfmi7qRAplXLb1qZZ", //Same as password for logging in
            database: 'ZOEHARMANING' //same as database name for DB connection
        });
    }

    const [results,] = await connection.execute(sql, params);
    return results;
}

app.get(
    '/classes',
    upload.none(),
    async (request, response) => {
        let result = {};
        try {
            let selectSql = `SELECT
                    c.id,
                    c.class,
                    c.level,
                    p.first_name AS first_name,
                    p.last_name AS last_name,
                    c.category,
                    c.semester,
                    c.credits
                FROM course_list c
                INNER JOIN professors p
                ON c.professor_id = p.id`,
                whereStatements = [],
                orderByStatements = [],
                queryParameters = [];

            if (typeof request.query.spring !== 'undefined' && parseInt(request.query.spring) === 0) {
                whereStatements.push('semester != ?'); //column, comparison, value
                queryParameters.push('spring');
            }

            if (typeof request.query.fall !== 'undefined' && parseInt(request.query.fall) === 0) {
                whereStatements.push('semester != ?'); //column, comparison, value
                queryParameters.push('fall');
            }

            if (typeof request.query.category !== 'undefined' && request.query.category.length > 0) {
                whereStatements.push('category = ?'); //column, comparison, value
                queryParameters.push(request.query.category);
            }

            if (typeof request.query.professor !== 'undefined' && request.query.professor.length > 0) {
                whereStatements.push('professor LIKE ?'); //column, comparison, value
                queryParameters.push('%' + request.query.professor + '%');
            }

            if (typeof request.query.level !== 'undefined' && request.query.level.length > 0) {
                orderByStatements.push('level ' + request.query.level);
            }

            //Dynamically add WHERE expressions to SELECT statements if needed
            if (whereStatements.length > 0) {
                selectSql = selectSql + ' WHERE ' + whereStatements.join(' AND ');
            }

            //Dynamically add ORDER BY expressions to SELECT statements if needed
            if (orderByStatements.length > 0) {
                selectSql = selectSql + ' ORDER BY ' + orderByStatements.join(', ');
            }

            //Dynamically add LIMIT expressions to SELECT statements if needed
            if (typeof request.query.limit !== 'undefined' && request.query.limit > 0 && request.query.limit < 6) {
                selectSql = selectSql + ' LIMIT ' + request.query.limit;
            }

            result = await query(selectSql, queryParameters);
        } catch (error) {
            console.log(error);
            return response.status(500) //Error code 
                .json({ message: 'Something went wrong with the server.' });
        }
        //Default response object
        response.json({ 'data': result });
    });

app.get(
    '/survey/:id/',
    upload.none(),
    async (request, response) => {
        try {
            const selectSql = `
                SELECT
                    c.id,
                    c.class,
                    c.level,
                    c.professor_id,
                    c.category,
                    c.semester,
                    c.credits
                FROM course_list c
                WHERE c.id = ?
            `;

            const result = await query(selectSql, [request.params.id]);

            console.log("ROW:", result);

            response.json({ data: result });

        } catch (error) {
            console.log("ERROR:", error);
            return response.status(500).json({
                message: 'Something went wrong with the server.'
            });
        }
    }
);

//Everything before the main logic is a setup for the main logic!! (MIDDLEWARE)
app.post(
    '/classes',
    upload.none(),
    // Parse JSON body
    express.json(),

    // Validators (middleware)
    check('courseLevel', "Please select a valid course level.")
        .isIn(['100', '200', '300', '400', '500', '600']),

    check('professor_id')
        .isIn(['1', '2', '3', '4', '5', '6', '7', '8']),

    check('classCategory', "Please select a valid class category.")
        .isIn(['GIMM', 'University Foundations', 'ITM', 'Anthropology', 'Kinesiology', 'Math']),

    check('courseName')
        .isLength({ min: 1, max: 100 })
        .withMessage('Course name must be between 1 and 100 characters.'),

    check('springOffered')
        .isIn([0, 1, true, false]),

    check('fallOffered')
        .isIn([0, 1, true, false]),

    check('creditAmount')
        .isInt({ min: 0, max: 4 })
        .withMessage('Credit amount must be a valid number.'),

    // MAIN HANDLER
    async (request, response) => {
        try {
            const errors = validationResult(request);

            if (!errors.isEmpty()) {
                return response.status(400).json({
                    message: 'Invalid input',
                    errors: errors.array()
                });
            }

            // Extract values
            const {
                courseName,
                courseLevel,
                professor_id,
                classCategory,
                springOffered,
                fallOffered,
                creditAmount
            } = request.body;
            let semester = null;
            if (springOffered && fallOffered) {
                semester = 'both';
            } else if (springOffered) {
                semester = 'spring';
            } else if (fallOffered) {
                semester = 'fall';
            } else {
                return response.status(400).json({
                    message: 'Please select at least one semester.'
                });
            }

            const sql = `
                INSERT INTO course_list
                (class, level, professor_id, category, semester, credits)
                VALUES (?, ?, ?, ?, ?, ?)
            `;

            await query(sql, [
                courseName,
                courseLevel,
                professor_id,
                classCategory,
                semester,
                creditAmount
            ]);

            return response.json({ message: 'Course added successfully' });

        } catch (error) {
            console.log(error);
            return response.status(500).json({
                message: 'Server error'
            });
        }
    }
);

app.put(
    '/classes/:id',
    upload.none(),
    // Parse JSON body
    express.json(),

    // Validators (middleware)
    check('courseLevel', "Please select a valid course level.")
        .isIn(['100', '200', '300', '400', '500', '600']),

    check('professor_id')
        .isIn(['1', '2', '3', '4', '5', '6', '7', '8']),

    check('classCategory', "Please select a valid class category.")
        .isIn(['GIMM', 'University Foundations', 'ITM', 'Anthropology', 'Kinesiology', 'Math']),

    check('courseName')
        .isLength({ min: 1, max: 100 })
        .withMessage('Course name must be between 1 and 100 characters.'),

    check('springOffered')
        .isIn([0, 1, true, false]),

    check('fallOffered')
        .isIn([0, 1, true, false]),

    check('creditAmount')
        .isFloat({ min: 0, max: 4 })
        .withMessage('Credit amount must be a valid number.'),

    // MAIN HANDLER
    async (request, response) => {
        try {
            const errors = validationResult(request);

            if (!errors.isEmpty()) {
                return response.status(400).json({
                    message: 'Invalid input',
                    errors: errors.array()
                });
            }

            const {
                courseName,
                courseLevel,
                professor_id,
                classCategory,
                springOffered,
                fallOffered,
                creditAmount
            } = request.body;

            // Determine semester
            let semester = null;
            if (springOffered && fallOffered) {
                semester = 'both';
            } else if (springOffered) {
                semester = 'spring';
            } else if (fallOffered) {
                semester = 'fall';
            } else {
                return response.status(400).json({
                    message: 'Please select at least one semester.'
                });
            }

            const courseId = request.params.id;

            const updateSQL = `
            UPDATE course_list
            SET class = ?, 
                level = ?, 
                professor_id = ?, 
                category = ?, 
                semester = ?, 
                credits = ?
            WHERE id = ?
        `;

            await query(updateSQL, [
                courseName,
                courseLevel,
                professor_id,
                classCategory,
                semester,
                creditAmount,
                courseId
            ]);

            return response.json({ message: 'Course updated successfully' });

        } catch (error) {
            console.log(error);
            return response.status(500).json({
                message: 'Server error'
            });
        }
    }
);

app.listen(port, () => {
    console.log(`Application listening at http://localhost:${port}`);
})