import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { TranslateModule } from '@ngx-translate/core';

import { LayoutRoutingModule } from './layout-routing.module';
import { LayoutComponent } from './layout.component';
import { HeaderComponent, SidebarComponent } from '../shared';

@NgModule({
  imports: [
    CommonModule,
    NgbModule.forRoot(),
    LayoutRoutingModule,
    TranslateModule
  ],
  declarations: [
    LayoutComponent,
    HeaderComponent,
    SidebarComponent,
  ]
})
export class LayoutModule { }
