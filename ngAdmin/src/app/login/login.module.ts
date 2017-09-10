import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

import { LoginRoutingModule } from './login-routing.module';
import { LoginComponent } from './login.component';
import { AngularFontAwesomeModule } from 'angular-font-awesome/angular-font-awesome';

@NgModule({
    imports: [
        CommonModule,
        HttpClientModule,
        FormsModule,
        AngularFontAwesomeModule,
        LoginRoutingModule
    ],
    declarations: [LoginComponent]
})
export class LoginModule {
}
