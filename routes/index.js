var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/foo', function(req, res, next) {
  if(process.env.MYKEY){
    console.log('My Key: ', process.env.MYKEY);
  } else{
    console.log('Did not find key');
  }

  res.render('index', { title: 'Express' });
});

module.exports = router;
