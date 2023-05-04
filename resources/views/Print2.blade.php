<table>
    <tr>
        {{-- =================== Biodata KIP  ===================== --}}

        <th>
            <h2 class="title">
                KIP
            </h2>

            <ul>
                <li class="list-item">
                    <span>Penerima KIP</span>
                    <span>:</span>
                    <span>{{ $data['receiver_kip'] }}</span>
                </li>
                <li class="list-item">
                    <span>Nama KIP</span>
                    <span>:</span>
                    <span>{{ $data['name_kip'] }}</span>
                </li>
                <li class="list-item">
                    <span>No KIP</span>
                    <span>:</span>
                    <span>{{ $data['no_kip'] }}</span>
                </li>
                <li class="list-item">
                    <span>Alasan Penerima KIP</span>
                    <span>:</span>
                    <br><br>
                    {{ $data['reason_kip'] }}
                </li>
            </ul>
        </th>

        {{-- =================== Biodata KIP  ===================== --}}

        {{-- =================== Biodata KPS  ===================== --}}

        <th>
            <h2 class="title mt-2">
                KPS
            </h2>

            <ul>
                <li class="list-item">
                    <span>Penerima KPS</span>
                    <span>:</span>
                    <span>{{ $data['receiver_kps'] }}</span>
                </li>
                <li class="list-item">
                    <span>No KPS</span>
                    <span>:</span>
                    <span>{{ $data['no_kps'] }}</span>
                </li>
            </ul>
        </th>

        {{-- =================== Biodata KPS  ===================== --}}

    </tr>
</table>

{{-- =================== Biodata KKS  ===================== --}}

<br> <br>
<h2 class="title">
    KKS
</h2>
<ul>
    <li class="list-item">
        <span>No KKS</span>
        <span>:</span>
        <span>{{ $data['no_kks'] }}</span>
    </li>
</ul>

{{-- =================== Biodata KKS  ===================== --}}

<table>
    <tr>
        {{-- =================== Biodata Beasiswa  ===================== --}}

        <th>
            <h2 class="title">
                Beasiswa
            </h2>
            @foreach ($old_data->scholarship as $key => $scholarship)
                <ul>
                    <span style="margin-left: 5em;">No.
                        {{ $key + 1 }}</span>
                    <br>

                    <li class="list-item">
                        <span>Jenis Beasiswa</span>
                        <span>:</span>
                        <span>{{ $scholarship->type }}</span>
                    </li>
                    <li class="list-item">
                        <span>Tahun Mulai</span>
                        <span>:</span>
                        <span>{{ $scholarship->year_start_at }}</span>
                    </li>
                    <li class="list-item">
                        <span>Tahun Selesai</span>
                        <span>:</span>
                        <span>{{ $scholarship->year_finish_at }}</span>
                    </li>
                </ul>
            @endforeach
        </th>

        {{-- =================== Biodata Beasiswa  ===================== --}}

        {{-- =================== Biodata Prestasi  ===================== --}}

        <th>
            <h2 class="title">
                Prestasi
            </h2>
            @foreach ($old_data->achievement as $key => $achievement)
                <ul>
                    <span>No.
                        {{ $key + 1 }}</span>
                    <br>
                    <li class="list-item">
                        <span>Jenis Prestasi</span>
                        <span>:</span>
                        <span>{{ $achievement->type }}</span>
                    </li>
                    <li class="list-item">
                        <span>Name Prestasi</span>
                        <span>:</span>
                        <span>{{ $achievement->achievement_name }}</span>
                    </li>
                    <li class="list-item">
                        <span>Tingkat</span>
                        <span>:</span>
                        <span>{{ $achievement->level }}</span>
                    </li>
                    <li class="list-item">
                        <span>Tahun</span>
                        <span>:</span>
                        <span>{{ $achievement->year }}</span>
                    </li>
                    <li class="list-item">
                        <span>Penyelenggara </span>
                        <span>:</span>
                        <span>{{ $achievement->organizer_by }}</span>
                    </li>
                </ul>
            @endforeach

            {{-- =================== Biodata Prestasi  ===================== --}}
        </th>
    </tr>
</table>
