<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Seeder;

class QuotesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        DB::table('quotes')->insert([
            [
                'subject '        => 1,
                'description'     => 'Need Sofa',
                'billing_address' => 'kannur',
                'shipping_address'=> 'kannur',
                'discount_percent'=> 0,

            ],
        ]);
    }
}
