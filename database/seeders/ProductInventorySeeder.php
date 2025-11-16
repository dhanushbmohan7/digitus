<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Seeder;

class ProductInventorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('product_inventories')->insert([
            [
                'product_id' => 1,
                'in_stock'   => 50,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'product_id' => 2,
                'in_stock'   => 120,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
