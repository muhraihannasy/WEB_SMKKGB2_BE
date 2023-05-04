    <h1 style="text-align: center;"> Formulir Pendaftaran <br> SMK Karya Guna Bhakti 2 Bekasi <br> Tahun 2023 </h1>


    {{-- =================== Biodata Calon Siswa ===================== --}}

    <h2 class="title">
        Biodata Calon Siswa
    </h2>
    <ul>
        <li class="list-item">
            <span>Nama Lengkap</span>
            <span>:</span>
            <span>{{ $old_data->fullname }}</span>
        </li>
        <li class="list-item">
            <span>Jenis Kelamin</span>
            <span>:</span>
            <span>{{ $old_data->student->gender }}</span>
        </li>
        <li class="list-item">
            <span>NISN</span>
            <span>:</span>
            <span>{{ $old_data->student->nisn }}</span>
        </li>
        <li class="list-item">
            <span>No. Registrasi Akta Lahir</span>
            <span>:</span>
            <span>{{ $old_data->student->no_certificate_registration }}</span>
        </li>
        <li class="list-item">
            <span>Tempat / Tanggal Lahir</span>
            <span>:</span>
            <span>{{ $data['birth_place'] }}, {{ $data['birth_date'] }}</span>
        </li>
        <li class="list-item">
            <span>Agama</span>
            <span>:</span>
            <span>{{ $old_data->student->religion }}</span>
        </li>
        <li class="list-item">
            <span>Berkebutuhan Khusus</span>
            <span>:</span>
            <span>{{ $old_data->special_needs }}</span>
        </li>
        <li class="list-item">
            <span>Nama Kecamatan</span>
            <span>:</span>
            <span>{{ $data['kecamatan'] }}</span>
        </li>
        <li class="list-item">
            <span>Nama Kelurahan</span>
            <span>:</span>
            <span>{{ $data['kelurahan'] }}</span>
        </li>
        <li class="list-item">
            <span>Alamat</span>
            <span>:</span>
            <span>{{ $data['alamat'] }}</span>
        </li>
        <li class="list-item">
            <span>RT</span>
            <span>:</span>
            <span>{{ $data['rt'] }}</span>
        </li>
        <li class="list-item">
            <span>RW</span>
            <span>:</span>
            <span>{{ $data['rw'] }}</span>
        </li>
        <li class="list-item">
            <span>Kodepos</span>
            <span>:</span>
            <span>{{ $data['kodepos'] }}</span>
        </li>

        <li class="list-item">
            <span>Tinggi Badan</span>
            <span>:</span>
            <span>{{ $old_data->student->height }} CM</span>
        </li>
        <li class="list-item">
            <span>Berat Badan</span>
            <span>:</span>
            <span>{{ $old_data->student->weight }} KG</span>
        </li>
    </ul>

    {{-- =================== Biodata Calon Siswa  ===================== --}}

    <br>

    {{-- =================== Biodata Ayah  ===================== --}}

    <h2 class="title">
        Data Ayah Kandung
    </h2>
    <ul>
        <li class="list-item">
            <span>Nama Ayah Kandung</span>
            <span>:</span>
            <span>{{ $old_data->student->father_name }}</span>
        </li>
        <li class="list-item">
            <span>Nik</span>
            <span>:</span>
            <span>{{ $old_data->student->father_nik }}</span>
        </li>
        <li class="list-item">
            <span>Tempat / Tanggal Lahir</span>
            <span>:</span>
            <span>{{ $data['father_birth_place'] }}, {{ $data['father_birth_date'] }}</span>
        </li>
        <li class="list-item">
            <span>Pendidikan</span>
            <span>:</span>
            <span>{{ $old_data->student->father_education }}</span>
        </li>
        <li class="list-item">
            <span>Pekerjaan</span>
            <span>:</span>
            <span>{{ $old_data->student->father_job }}</span>
        </li>
        <li class="list-item">
            <span>Penghasilan Bulanan</span>
            <span>:</span>
            <span>{{ $old_data->student->father_income }}</span>
        </li>
    </ul>

    {{-- =================== Biodata Ayah  ===================== --}}


    <br>


    {{-- =================== Biodata Ibu Kandung  ===================== --}}

    <h2 class="title">
        Data Ibu Kandung
    </h2>
    <ul>
        <li class="list-item">
            <span>Nama Ibu Kandung</span>
            <span>:</span>
            <span>{{ $old_data->student->mother_name }}</span>
        </li>
        <li class="list-item">
            <span>Nik</span>
            <span>:</span>
            <span>{{ $old_data->student->mother_nik }}</span>
        </li>
        <li class="list-item">
            <span>Tempat / Tanggal Lahir</span>
            <span>:</span>
            <span>{{ $data['mother_birth_place'] }}, {{ $data['mother_birth_date'] }}</span>
        </li>
        <li class="list-item">
            <span>Pendidikan</span>
            <span>:</span>
            <span>{{ $old_data->student->mother_education }}</span>
        </li>
        <li class="list-item">
            <span>Pekerjaan</span>
            <span>:</span>
            <span>{{ $old_data->student->mother_job }}</span>
        </li>
        <li class="list-item">
            <span>Penghasilan Bulanan</span>
            <span>:</span>
            <span>{{ $old_data->student->mother_income }}</span>
        </li>
    </ul>

    {{-- =================== Biodata Ibu Kandung  ===================== --}}


    <br>

    {{-- =================== Data Registrasi  ===================== --}}

    <h2 class="title">
        Data Registrasi
    </h2>

    <ul>
        <li class="list-item">
            <span>Baju Olahraga</span>
            <span>:</span>
            <span>{{ $data['uniform1'] }}</span>
        </li>
        <li class="list-item">
            <span>Baju Wear Pack</span>
            <span>:</span>
            <span>{{ $data['uniform2'] }}</span>
        </li>
        <li class="list-item">
            <span>Baju Kotak-Kotak</span>
            <span>:</span>
            <span>{{ $data['uniform3'] }}</span>
        </li>
        <li class="list-item">
            <span>Jaz Almamater</span>
            <span>:</span>
            <span>{{ $data['uniform4'] }}</span>
        </li>
        <li class="list-item">
            <span>Pilihan Extrakulikuler 1</span>
            <span>:</span>
            <span>{{ $data['extra1'] }}</span>
        </li>
        <li class="list-item">
            <span>Pilihan Extrakulikuler 2</span>
            <span>:</span>
            <span>{{ $data['extra2'] }}</span>
        </li>
        <li class="list-item">
            <span>Pilihan Kompetensi 1</span>
            <span>:</span>
            <span>{{ $data['class_pick1'] }}</span>
        </li>
        </li>
        <li class="list-item">
            <span>Pilihan Kompetensi 2</span>
            <span>:</span>
            <span>{{ $data['class_pick2'] }}</span>
        </li>
        <li class="list-item">
            <span>Pilihan Kompetensi 3</span>
            <span>:</span>
            <span>{{ $data['class_pick3'] }}</span>
        </li>
    </ul>

    {{-- =================== Biodata Registrasi  ===================== --}}



    {{-- 
    <section class="mt-2">
        <div class="container">

            <ul class="mt-1">
                @if ($data['kps_image'])
                    <li class="list-item-image">
                        <h3>KPS :</h3>
                        <img src={{ public_path($data['kps_image']) }} alt="" class="image">
                    </li>
                @endif
            </ul>
        </div>
    </section>

    <section style="margin-top: 10em; padding-top: 2em;">
        <div class="container">

            <ul class="mt-1">
                @if ($data['kip_image'])
                    <li class="list-item-image">
                        <h3>KKS :</h3>
                        <img src={{ public_path($data['kks_image']) }} alt="" class="image">
                    </li>
                @endif
            </ul>
        </div>
    </section> --}}
