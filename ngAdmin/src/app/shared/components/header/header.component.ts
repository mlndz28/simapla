import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { HttpClient , HttpParams , HttpHeaders } from '@angular/common/http';

@Component({
    selector: 'app-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {


    name;

    constructor(private translate: TranslateService, public router: Router, private http: HttpClient) {
        this.router.events.subscribe((val) => {
            if (val instanceof NavigationEnd && window.innerWidth <= 992) {
                this.toggleSidebar();
            }
        });
        this.getUserInfo();
    }

    ngOnInit() {

    }

    getUserInfo() {
      let url = `http://localhost:1337/ws/personInfo/${localStorage.getItem('uid')}`;
      let auth = 'Bearer ' + localStorage.getItem('token');
      let headers = new HttpHeaders().set('Authorization', auth);

      this.http.get(
        url,
        {headers: headers}
      )
      .subscribe(
        (data : any) => {
          if (!data.data[0][0]) console.log('no data');
          let response = data.data[0][0];

          if (!data.error && response.name.length>0 && response.lastname.length>0) {
            this.name = `${response.name} ${response.lastname}`;
            console.log(this.name);
          }
          else{
            console.log('incomplete data');
          }
        err => {
          console.log(err)
        }
      });
    }

    toggleSidebar() {
        const dom: any = document.querySelector('body');
        dom.classList.toggle('push-right');
    }

    rltAndLtr() {
        const dom: any = document.querySelector('body');
        dom.classList.toggle('rtl');
    }

    logout() {
        localStorage.removeItem('isLoggedin');
        localStorage.removeItem('token');
        localStorage.removeItem('uid');
    }

    changeLang(language: string) {
        this.translate.use(language);
    }
}
