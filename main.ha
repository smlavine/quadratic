use fmt;
use math::{sqrtf64};
use math::complex::{c128, sqrtc128, divc128, addc128, subc128};
use os;
use strconv;

def FORMULA: str =
`          ----------
   -b ± \/ b² - 4ac
------------------------
          2a
`;

export fn quadratic_formula(a: f64, b: f64, c: f64) (c128, c128) = {
	const discriminant = (b * b) - (4f64 * a * c);
	const _2a = 2f64 * a;

	if (discriminant < 0f64) {
		const sqrt = sqrtc128((discriminant, 0f64));
		return (divc128(addc128((-b, 0f64), sqrt), (_2a, 0f64)),
			divc128(subc128((-b, 0f64), sqrt), (_2a, 0f64)),
		);
	} else {
		const sqrt = sqrtf64(discriminant);
		return (((-b - sqrt) / _2a, 0f64), ((-b + sqrt) / _2a, 0f64));
	};
};

export fn main() void = {
	if (len(os::args) != 4) {
		fmt::fatalf("{}\nusage: {} a b c", FORMULA, os::args[0]);
	};
	const args = os::args[1..];

	let abc: [3]f64 = [0f64...];
	for (let i = 0z; i < 3; i += 1) {
		match (strconv::stof64(args[i])) {
		case strconv::invalid =>
			fmt::fatalf("{}: invalid number \"{}\"",
				os::args[0], args[i]);
		case strconv::overflow =>
			fmt::fatalf("{}: overflow parsing \"{}\"",
				os::args[0], args[i]);
		case let f: f64 =>
			abc[i] = f;
		};
	};

	const xs = quadratic_formula(abc[0], abc[1], abc[2]);
	if (xs.0.1 == 0f64) {
		fmt::printf("{}\n{}\n", xs.0.0, xs.1.0)!;
	} else {
		fmt::printfln("{} + {}i", xs.0.0, xs.0.1)!;
		fmt::printfln("{} + {}i", xs.1.0, xs.1.1)!;
	};
};
