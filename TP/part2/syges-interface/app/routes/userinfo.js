var express   = require('express');
var router    = express.Router();

router.get('/:username', function(req, res) {

    var collaborator = require('../entities/collaborator');

    collaborator.getInformation(req.params.username, function(information) {

        try {
            collaborator.getManagerInformation(information.id, function(managerInformation) {

                information.managerRole = managerInformation;
                res.json(information);
            });
        }
        catch (e) {
            res.status(404).json({error: 'user not found'});
        }

    });

});

module.exports = router;
