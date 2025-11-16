<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Seeder;

class ProductsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        DB::table('products')->insert([
            [
                'sku'   => 'PROD001',
                'name'  => 'Wodden Chair',
                'price' => 50000,

                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'sku'   => 'PROD002',
                'name'  => 'Offcie Sofa',
                'price' => 35000,

                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'sku'   => 'PROD003',
                'name'  => 'Plastic Chair',
                'price' => 15000,

                'created_at' => now(),
                'updated_at' => now(),
            ],

        ]);

    }
}
