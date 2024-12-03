if (typeof MyClass == 'undefined') {
    var MyClass = class  {
      constructor(id) {
        this.id = id;
      }
      
      getId() { 
        return this.id;
      }
    }
  }
  async function test(a,b,c) {
    var obj = new MyClass(1);
    var jsonStringified = JSON.stringify(obj);
    var value = Math.trunc(Math.random() * 100).toString();
    var asyncResult = await sendMessage("getDataAsync", JSON.stringify({"count": Math.trunc(Math.random() * 10)}));
    var err;
    try {
      await sendMessage("asyncWithError", "{}");
    } catch(e) {
      err = e.message || e;
    }
    return {"object": jsonStringified, "expression": value, "para1":`${a}`,"para2":`${b}`,"para3":`${c}`,"asyncResult": asyncResult, "expectedError": err};
  }