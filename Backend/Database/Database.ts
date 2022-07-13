
  
  class Database {

    async getWorkedYesterday(){
        return {
            "engineers":[
                {"id" : 7,
                "name": "Col Fays",
                "shiftsWorked": 1,
                "workedYesterday":true
            },
            {"id" : 10,
            "name": "Stan Dupp",
            "shiftsWorked": 1,
            "workedYesterday":true
        }
            ]
        }
    }

    /**
     *
     * @description returns all the current Engineers
     *
     */
    async all() {
       return {
        "engineers":[
          {"id" : 1,
            "name": "Alice jones",
            "shiftsWorked": 0,
            "workedYesterday":false
        } ,
        {"id" : 2,
            "name": "Olive Yew",
            "shiftsWorked": 1,
            "workedYesterday":false
        },
        {"id" : 3,
            "name": "Constance Noring",
            "shiftsWorked": 0,
            "workedYesterday":false
        },
        {"id" : 4,
            "name": "Ray O’Sun",
            "shiftsWorked": 0,
            "workedYesterday":false
        },
        {"id" : 5,
            "name": "Rita Book",
            "shiftsWorked": 0,
            "workedYesterday":false
        },
        {"id" : 6,
            "name": "Rod Knee",
            "shiftsWorked": 0,
            "workedYesterday":false
        },
        {"id" : 7,
            "name": "Col Fays",
            "shiftsWorked": 1,
            "workedYesterday":true
        },
        {"id" : 8,
            "name": "Dee Zynah",
            "shiftsWorked": 0,
            "workedYesterday":false
        },
        {"id" : 9,
            "name": "Theresa Green",
            "shiftsWorked": 0,
            "workedYesterday":false
        },
        {"id" : 10,
            "name": "Stan Dupp",
            "shiftsWorked": 1,
            "workedYesterday":true
        }
        ]
    }
    } 
  }
  
  export default new Database()