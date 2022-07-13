import express from 'express';
import controller from '../Controllers/EngineerController';

const router = express.Router();

router.get('/getEngineers', controller.getEngineers);
router.get('/workedYesterday', controller.getWorkedYesterday);

export = router;