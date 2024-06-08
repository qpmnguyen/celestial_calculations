### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ d0276f3c-8245-4d78-ac39-dc6f6776fc17
using PlutoLinks: @ingredients

# ╔═╡ 3b8af58a-8391-4d5e-a61e-821eb0aed597
md"""
## Chapter 2: Conversions
**From the Celestial Calculations book by J.L. Lawrence (MIT Press)**.

Here, the conversion is simply between the formatted form of dms (or degree, arcminutes, and arcseconds) and the numeric form. Some exercises are completed here. First we import the dms `struct` from the relevant `objects.jl` script
"""

# ╔═╡ 180b183a-a1d4-4eb5-b1e8-7c845db42179
Objects=@ingredients("./objects.jl")

# ╔═╡ f8c996ac-c0c2-4375-8e9c-cb2a7788b04d
begin
	Objects.dms(0,1,2)
	fieldnames(Objects.dms)
end



# ╔═╡ 142baac2-4362-4003-b97c-9effa049970c
md"""
### Converting dms and hms to numeric
"""

# ╔═╡ e030e28b-6479-4684-ba8e-1e41cf5d27c4
md"""
`to_numeric` here is a function that converts the dms object to numeric form. Using a different signatures, we can define functions that allow you to convert from hms to numerc as well. 
"""

# ╔═╡ dec809b0-25d8-11ef-2812-4783e9e0845d
begin
	function to_numeric(x::Objects.dms)
		if (x.deg < 0)
			sign = -1
		else
			sign = 1
		end
		deg = abs(x.deg)
		tamin = x.amin + x.asec/60
		tdeg = (deg + tamin/60) * sign
		return(tdeg)
	end
	
	function to_numeric(x::Objects.hms)
		tmin = x.min + x.sec/60
		thr = x.hr + tmin/60
		return(thr)
	end
end

# ╔═╡ 6e3a7233-a10e-4711-812f-fdf78e919ac3
md"""
Exercises 19 and 17 deal with converting dms and hms to numeric forms. 
"""

# ╔═╡ 4e5d5d9c-719b-473f-b2c3-a607d8db8bd0
begin
	ex19 = Objects.dms(13,4,10)
	to_numeric(ex19)
end

# ╔═╡ f628a4c8-8318-4b71-a48a-6d1865b25c6d
begin
	ex17 = Objects.hms(10,25,11)
	to_numeric(ex17)
end

# ╔═╡ 38ef1e43-fa41-478a-b539-f725dc780c9e
md"""
### Converting numeric numbers back to dms/hms formats
"""

# ╔═╡ c489fbc4-e097-413b-91a1-df55a2e9cda3
function back_convert(x::Float64, to)
	if (to == "dms")
		if (x < 0)
			sign = -1
		else 
			sign = 1
		end
		deg = floor(Int, x) * sign
		min = floor(Int, 60 * modf(x)[1])
		sec = round(60 * modf(60 * modf(x)[1])[1], digits=2)
		out = Objects.dms(deg, min, sec)
	elseif (to == "hms")
		hr = floor(Int, x)
		min = floor(Int, 60 * modf(x)[1])
		sec = round(60 * modf(60 * modf(x)[1])[1], digits=2)
		out = Objects.hms(hr, min, sec)
	end
	return(out)
end

# ╔═╡ d2ca0843-d6ab-411f-bdb3-a933efe73d52
begin
	ex20 = -0.508333
	back_convert(ex20, "dms")
end

# ╔═╡ e4e3bb2e-4bb8-4ac0-9634-4da9938c49b5
begin
	ex18 = 20.352
	back_convert(ex18, "hms")
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoLinks = "0ff47ea0-7a50-410d-8455-4348d5de0420"

[compat]
PlutoLinks = "~0.1.6"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.4"
manifest_format = "2.0"
project_hash = "522e6e223064423c7d6f5c72291e0125cb8eff30"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "c0216e792f518b39b22212127d4a84dc31e4e386"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.5"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "e9648d90370e2d0317f9518c9c6e0841db54a90b"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.31"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.6.4+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "c6a36b22d2cca0e1a903f00f600991f97bf5f426"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.4.6"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+1"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.1.10"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OrderedCollections]]
git-tree-sha1 = "dfdf5519f235516220579f949664f1bf44e741c5"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.3"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.10.0"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "8f5fa7056e6dcfb23ac5211de38e6c03f6367794"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.6"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "12aa2d7593df490c407a3bbd8b86b8b515017f3e"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.5.14"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─3b8af58a-8391-4d5e-a61e-821eb0aed597
# ╠═d0276f3c-8245-4d78-ac39-dc6f6776fc17
# ╠═180b183a-a1d4-4eb5-b1e8-7c845db42179
# ╠═f8c996ac-c0c2-4375-8e9c-cb2a7788b04d
# ╟─142baac2-4362-4003-b97c-9effa049970c
# ╟─e030e28b-6479-4684-ba8e-1e41cf5d27c4
# ╠═dec809b0-25d8-11ef-2812-4783e9e0845d
# ╟─6e3a7233-a10e-4711-812f-fdf78e919ac3
# ╠═4e5d5d9c-719b-473f-b2c3-a607d8db8bd0
# ╠═f628a4c8-8318-4b71-a48a-6d1865b25c6d
# ╟─38ef1e43-fa41-478a-b539-f725dc780c9e
# ╠═c489fbc4-e097-413b-91a1-df55a2e9cda3
# ╠═d2ca0843-d6ab-411f-bdb3-a933efe73d52
# ╠═e4e3bb2e-4bb8-4ac0-9634-4da9938c49b5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
