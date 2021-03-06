import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule }   from '@angular/forms';
import { HeroDetailComponent } from './hero-detail.component';
import { AppComponent }  from './app.component';
import { HeroService } from './hero.service';
import { HeroesComponent } from './heroes.component';

@NgModule({
  imports: [
    BrowserModule,
    FormsModule
  ],
  declarations: [
    AppComponent,
    HeroDetailComponent,
    HeroesComponent
  ],
  bootstrap: [ AppComponent ],
  providers: [HeroService]
})
export class AppModule { }
