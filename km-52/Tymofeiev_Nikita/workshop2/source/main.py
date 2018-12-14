'''
Create 2 dictionaries^ lab(lab_id, lab_name, subj_code) and subject(subj_code, subj_name)
'''

from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

subj_dict = {
    "subj_code": "666",
    "subj_name": "DBMS"
}

lab_dict = {
    "lab_id": "2",
    "lab_name": "Flask",
    "subj_code": "666"
}


@app.route('/api/<action>', methods=['GET'])

def apiget(action):
    if action == "subject":
        return render_template("subj.html", subj=subj_dict)
    elif action == "lab":
        return render_template("lab.html", lab=lab_dict)
    elif action == "all":
        return render_template("all.html", subj=subj_dict, lab=lab_dict)
    else:
        return render_template("404.html", action_value=action)


@app.route('/api', methods=['POST'])

def apipost():

    if request.form["action"] == "lab_update":

        lab_dict["lab_id"] = request.form["lab_id"]
        lab_dict["lab_name"] = request.form["lab_name"]
        lab_dict["subj_code"] = request.form["subj_code"]

        return redirect(url_for('apiget', action="all"))

    elif request.form["action"] == "subj_update":

        subj_dict["subj_code"] = request.form["subj_code"]

        subj_dict["subj_name"] = request.form["subj_name"]

        return redirect(url_for('apiget', action="all"))

if __name__ == '__main__':
    app.run(debug= True)



