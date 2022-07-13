import { Request, Response} from 'express';
import database from "../../Database/Database"


// getting all Engineers
const getEngineers = async (req: Request, res: Response) => {
    const db = await  database.all()

    console.log(db)
    
    return res.status(200).json({
        message: db
    });
};

//getting worked yesterday
const getWorkedYesterday = async (req: Request, res: Response) => {
    const db = await  database.getWorkedYesterday()

    console.log(db)
    
    return res.status(200).json({
        message: db
    });
};


export default {getEngineers,getWorkedYesterday};