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
  isRequestingLogin = false;

    constructor(public router: Router, private http: HttpClient) {
    }

    ngOnInit() {
    }

    login() {
      let url = 'http://localhost:1337/login';
      let body = this.toQueryString(this.getFormData());
      console.log(body);

      this.isRequestingLogin = true;

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
            localStorage.setItem('uid', data.uid);
            this.router.navigateByUrl('/dashboard');
          }
          this.isRequestingLogin = false;
        err => {
          this.isRequestingLogin = false;
          console.log(err)
        }
      });
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
