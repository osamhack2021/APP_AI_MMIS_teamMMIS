var express = require('express');
var router = express.Router();
const mysql = require('mysql');


const connection =   mysql.createPool({
    user:'admin',
    password:'05751234',
    database: 'MMIS',
    host:'mmis.cip9531xqh6o.ap-northeast-2.rds.amazonaws.com',
});

router.post('/', async (req, res) => {
    var al = req.body.allergy;
    var sql = `insert into normaluser (name, militaryNumber, password, grade, belong) value (\'${req.body.name}\', \'${req.body.militaryNumber}\',\'${req.body.password}\',\'${req.body.grade}\',\'${req.body.belong}\');`;
    var sql1 = `select * from normaluser where militaryNumber = \'${req.body.militaryNumber}\';`;
    var sql2 = `insert into normaluserallergy (militaryNumber,계란류, 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류, 잣) value (\'${req.body.militaryNumber}\',\'${al.계란류}\',\'${al.우유}\',\'${al.메밀}\',\'${al.땅콩}\',\'${al.대두}\',\'${al.밀}\',\'${al.고등어}\',\'${al.게}\',\'${al.새우}\',\'${al.돼지고기}\',\'${al.복숭아}\',\'${al.토마토}\',\'${al.아황산류}\',\'${al.호두}\',\'${al.닭고기}\',\'${al.쇠고기}\',\'${al.오징어}\',\'${al.조개류}\',\'${al.잣}\');`;

    connection.query(sql1, (error, results, field) => {
    if(error){
        console.log(error);
        res.send({"code" : -1});
    }
    else{
	if(results[0]){
	    res.send({"code" :2});
	}
	else{
	    connection.query(sql, (error, results1, fields) => {

            if (error) {
                console.log(error);
	    	res.send({"code" : -1});
            }
	    else{
		var newsql = `select * from normaluser where militaryNumber = \'${req.body.militaryNumber}\';`; 
		console.log(newsql);
		connection.query(newsql,(error, results2, fields) => {
		if(error){
		    res.send({"code" : -1});

		}
		else{
		   // var al_query = `select * from normaluserallergy where militaryNumber = \'${req.body.militaryNumber}\';`; 
		    var al_query = `select 계란류, 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류, 잣 from normaluserallergy where militaryNumber = \'${req.body.militaryNumber}\';`;

		    connection.query(sql2, (error, results3, fields) =>{
			if(error){
		    	    res.send({"code" : -1});

			}
			else{
		            connection.query(al_query, (error, results4, fields) =>{
			        if(error){
		    	    	    res.send({"code" : -1});
				}	
				else{
					console.log(results2);
					console.log(results4);
					var data = {"name" : req.body.name, "militaryNumber": req.body.militaryNumber, "password": req.body.password, "grade" : req.body.grade, "belong": req.body.belong, "allergy" : results4[0]};
					var noticeresponse = {"code" : 1, "msg" : "success", "data" : data};
		//res.send(results1[0]);
		                        res.send(noticeresponse);

				}
		    	    })

			}
		    })
		}
            	})
            }	
    	    })
	}
    }
    })

   //var body = req.body;
});


module.exports = router;
