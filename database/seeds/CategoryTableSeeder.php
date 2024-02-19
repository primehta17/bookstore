<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Category;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Category::create([
            'name' => 'Literarys',
            'slug' => 'literarys'
        ]);
        Category::create([
            'name' => 'Diets',
            'slug' => 'diets'
        ]);
        Category::create([
            'name' => 'Politics',
            'slug' => 'politics'
        ]);
        Category::create([
            'name' => 'Thrillers',
            'slug' => 'thrillers'
        ]);
        Category::create([
            'name' => 'Travels',
            'slug' => 'travels'
        ]);
        Category::create([
            'name' => 'Comics',
            'slug' => 'comics'
        ]);
    }
}
