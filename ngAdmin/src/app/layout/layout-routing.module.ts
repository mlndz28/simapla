import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LayoutComponent } from './layout.component';

const routes: Routes = [
    {
        path: '', component: LayoutComponent,
        children: [
            {
              path: 'dashboard',
              loadChildren: './dashboard/dashboard.module#DashboardModule'
            },
            {
              path: 'registro/estudiante',
              loadChildren: './registro/estudiante/estudiante.module#EstudianteModule'
            },
            {
              path: 'registro/profesor',
              loadChildren: './registro/profesor/profesor.module#ProfesorModule'
            },
            {
              path: 'registro/administrativo',
              loadChildren: './registro/administrativo/administrativo.module#AdministrativoModule'
            },
            {
                path: 'registro/agrupaciones',
              loadChildren: './registro/agrupaciones/agrupaciones.module#AgrupacionesModule'
            },
            {
              path: 'registro/eventos',
              loadChildren: './registro/eventos/eventos.module#EventosModule'
            },
            {
              path: 'grupos/manejo',
              loadChildren: './grupos/manejo-grupos/manejo-grupos.module#ManejoGruposModule'
            }
        ]
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class LayoutRoutingModule { }
