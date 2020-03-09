var express   = require('express');
var router    = express.Router();

router.get('/:login', function(req, res) {

    var collaborator = require('../entities/collaborator');

    collaborator.getPassword(req.params.login, function(response) {

        if (response === undefined) {
            res.status(404).json({error: 'user not found'});
        }
        else {
            res.json(response);
        }
    });

});

module.exports = router;