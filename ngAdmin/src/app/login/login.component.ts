import { Component, OnInit } from '@angular/core';
import { Router , ActivatedRouteSnapshot , RouterStateSnapshot} from '@angular/router';
import { HttpClient , HttpParams , HttpHeaders } from '@angular/common/http';
import { routerTransition } from '../router.animations';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss'],
    animations: [routerTransition()]
})
export class LoginComponent implements OnInit {

  carnet = "";
  password = "";

    constructor(public router: Router, private http: HttpClient) {
    }

    ngOnInit() {
    }

    login() {
      let url = 'http://localhost:1337/login'
      let body = this.toQueryString(this.getFormData());
      console.log(body);

      this.http.post(
        url,
        body,
        {headers: new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded')}
      )
      .subscribe(
        (data : any) => {
          if (!data.error && data.token.length>0) {
            localStorage.setItem('isLoggedin', 'true');
            localStorage.setItem('token', data.token);
            this.router.navigateByUrl('/dashboard');
          }
        err => {console.log(err)}
      });
    }

    onLoggedin() {
        localStorage.setItem('isLoggedin', 'true');
    }

    private getFormData() {
      return {
        carnet: this.carnet,
        password: this.password
      };
    };
    
    private clearFormData() {
      this.carnet = "";
      this.password = "";
    };

    private toQueryString(jsonBody: Object) {
      var keys = Object.keys(jsonBody).map(key => {
        return [key, jsonBody[key]].join('=');
      });
      let str = keys.join('&');
      return str;
    }

}
